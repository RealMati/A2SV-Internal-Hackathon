import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Admin } from 'mongodb';
import { Model } from 'mongoose';
import { Pharma } from 'src/auth/schema/pharma.schema';
import { User } from 'src/auth/schema/user.schema';

@Injectable()
export class MedicinesService {
  constructor(
    @InjectModel('User') private readonly userModel: Model<User>,
    @InjectModel('Pharma') private readonly pharmaModel: Model<Pharma>,
    @InjectModel('Admin') private readonly adminModel: Model<Admin>,
  ) {}

  async searchMedicine(medicine): Promise<Pharma[]> {
    return await this.pharmaModel.find({ medicines: medicine }).exec();
  }

  getInstruction() {
    return 'Get instruction';
  }

  notifyMe() {
    return 'Notify me';
  }

  getNotifyMe() {
    return 'Get notify me';
  }
}
