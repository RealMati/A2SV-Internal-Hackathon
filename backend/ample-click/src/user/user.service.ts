import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Admin } from 'mongodb';
import { Model } from 'mongoose';
import { Pharma } from 'src/auth/schema/pharma.schema';
import { User } from 'src/auth/schema/user.schema';
import { Request, Response } from 'express';
import * as jwt from 'jsonwebtoken';

@Injectable()
export class UserService {
  constructor(
    @InjectModel('User') private readonly userModel: Model<User>,
    @InjectModel('Admin') private readonly adminModel: Model<Admin>,
    @InjectModel('Pharma') private readonly PharmaModel: Model<Pharma>,
  ) {}
  async parseToken(req: Request) {
    try {
      if (!req.cookies?.accessToken) {
        throw new BadRequestException('Cookie not found');
      }
      const token = req.cookies.accessToken;
      const decoded = await jwt.verify(token, process.env.JWT_SECRET);
      const idStr = (decoded as any).id;
      const role = String((decoded as any).role);
      const user = await this.userModel.findById(idStr);
      if (role !== 'user') {
        console.log(role);
        throw new UnauthorizedException(
          'Logged in as an Admin, not as an Artist',
        );
      }
      if (!user) {
        throw new UnauthorizedException('User not found.');
      }
      return user;
    } catch (err) {
      throw new InternalServerErrorException(err.message);
    }
  }

  async getPharmacies(req: Request) {
    const user = await this.parseToken(req);

    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    const { medicine } = req.body;
    return await this.PharmaModel.find({ medicines: medicine }).exec();
  }
  updateProfile() {
    return 'Update profile';
  }

  deleteAccount() {
    return 'Delete account';
  }

  verifyUser() {
    return 'Verify user';
  }

  async notifyMe(req: Request) {
    const user = await this.parseToken(req);

    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    const { medicine } = req.body;
    const check = user.notify.includes(medicine);
    if (check) {
      throw new BadRequestException('Already added to notify list');
    }
    await user.notify.push(medicine);
    await user.save();
  }

  async getNotifyMe(req: Request) {
    const user = await this.parseToken(req);

    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    return user.notify;
  }

  addEmergencyContacts() {
    return 'Add emergency contacts';
  }
}
