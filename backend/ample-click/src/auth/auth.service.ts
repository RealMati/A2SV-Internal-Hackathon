import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from './schema/user.schema';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { UserRegisterDto } from './dto/user-register.dto';
import { Pharma } from './schema/pharma.schema';

import { PharmaRegisterDto } from './dto/pharma-register.dto';
import { Admin } from './schema/admin.schema';
import { UserLoginDto } from './dto/user-login.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel('User') private readonly userModel: Model<User>,
    @InjectModel('Admin') private readonly adminModel: Model<Admin>,
    @InjectModel('Pharma') private readonly PharmaModel: Model<Pharma>,
    private jwtService: JwtService,
  ) {}

  // User
  async userLogin(reqBody: UserLoginDto): Promise<{ token: string }> {
    const accObj = { ...reqBody };
    const user = await this.userModel.findOne({ email: accObj.email });
    if (!user) {
      throw new UnauthorizedException('Invalid email or password');
    }

    const valid = await bcrypt.compare(accObj.password, user.password);
    let accessToken: string;
    if (valid) {
      accessToken = this.jwtService.sign({ id: user._id, role: 'user' });
    }
    return { token: accessToken };
  }

  async userRegister(reqBody: UserRegisterDto): Promise<{ token: string }> {
    const check = await this.userModel.findOne({ email: reqBody.email });

    if (check) {
      throw new Error('User already exists');
      console.log(check);
    }

    const userObj = { ...reqBody };
    userObj.password = await bcrypt.hash(reqBody.password, 10);
    const user = await this.userModel.create(userObj);
    const token = this.jwtService.sign({ id: user._id, role: 'user' });
    return { token };
  }

  async userLogout() {
    return 'User logout';
  }

  // Admin

  async adminLogin(reqBody: UserLoginDto): Promise<{ token: string }> {
    const accObj = { ...reqBody };
    const admin = await this.adminModel.findOne({ email: accObj.email });
    if (!admin) {
      throw new UnauthorizedException('Invalid email or password');
    }

    const valid = await bcrypt.compare(accObj.password, admin.password);
    let accessToken: string;
    if (valid) {
      accessToken = this.jwtService.sign({ id: admin._id, role: 'admin' });
    }
    return { token: accessToken };
  }

  async adminRegister(reqBody: UserRegisterDto): Promise<{ token: string }> {
    const check = await this.adminModel.findOne({ email: reqBody.email });
    if (check) {
      throw new Error('User already exists');
    }

    const adminObj = { ...reqBody };
    adminObj.password = await bcrypt.hash(reqBody.password, 10);
    const admin = await this.adminModel.create(adminObj);
    const token = this.jwtService.sign({ id: admin._id, role: 'admin' });
    return { token };
  }

  async adminLogout() {
    return 'Admin logout';
  }

  // Pharmacy

  async pharmacyLogin(reqBody: UserLoginDto): Promise<{ token: string }> {
    const accObj = { ...reqBody };
    const pharma = await this.PharmaModel.findOne({ email: accObj.email });
    if (!pharma) {
      throw new UnauthorizedException('Invalid email or password');
    }

    const valid = await bcrypt.compare(accObj.password, pharma.password);
    let accessToken: string;
    if (valid) {
      accessToken = this.jwtService.sign({ id: pharma._id, role: 'pharmacy' });
    }
    return { token: accessToken };
  }

  async pharmacyRegister(
    reqBody: PharmaRegisterDto,
  ): Promise<{ token: string }> {
    const check = await this.PharmaModel.findOne({ email: reqBody.email });
    if (check) {
      throw new Error('User already exists');
    }

    const pharmaObj = { ...reqBody };
    pharmaObj.password = await bcrypt.hash(reqBody.password, 10);
    const pharma = await this.PharmaModel.create(pharmaObj);
    const token = this.jwtService.sign({ id: pharma._id, role: 'pharmacy' });
    return { token };
  }

  async pharmacyLogout() {
    return 'Pharmacy logout';
  }
}
