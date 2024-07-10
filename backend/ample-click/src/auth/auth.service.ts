import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from './schema/user.schema';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { UserRegisterDto } from './dto/user-register.dto';
import { Pharma } from './schema/pharma.schema';
import { Admin } from 'mongodb';
import { PharmaRegisterDto } from './dto/pharma-register.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel('User') private readonly userModel: Model<User>,
    @InjectModel('Admin') private readonly adminModel: Model<Admin>,
    @InjectModel('Pharmacy') private readonly PharmaModel: Model<Pharma>,
    private jwtService: JwtService,
  ) {}

  // User
  async userLogin() {
    return 'User login';
  }

  async userRegister(reqBody: UserRegisterDto): Promise<{ token: string }> {
    const check = this.userModel.findOne({ email: reqBody.email });
    if (check) {
      throw new Error('User already exists');
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

  async adminLogin() {
    return 'Admin login';
  }

  async adminRegister(reqBody: UserRegisterDto): Promise<{ token: string }> {
    const check = this.adminModel.findOne({ email: reqBody.email });
    if (check) {
      throw new Error('User already exists');
    }

    const adminObj = { ...reqBody };
    adminObj.password = await bcrypt.hash(reqBody.password, 10);
    const admin = await this.userModel.create(adminObj);
    const token = this.jwtService.sign({ id: admin._id, role: 'admin' });
    return { token };
  }

  async adminLogout() {
    return 'Admin logout';
  }

  // Pharmacy

  async pharmacyLogin() {
    return 'Pharmacy login';
  }

  async pharmacyRegister(
    reqBody: PharmaRegisterDto,
  ): Promise<{ token: string }> {
    const check = this.PharmaModel.findOne({ email: reqBody.email });
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
