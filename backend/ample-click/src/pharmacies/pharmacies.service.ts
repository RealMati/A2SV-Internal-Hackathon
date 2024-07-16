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
import { Request } from 'express';
import * as jwt from 'jsonwebtoken';

@Injectable()
export class PharmaciesService {
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
      const pharmacy = await this.PharmaModel.findById(idStr);
      if (role !== 'pharmacy') {
        console.log(role);
        throw new UnauthorizedException(
          'Logged in as an Admin, not as an Artist',
        );
      }
      if (!pharmacy) {
        throw new UnauthorizedException('User not found.');
      }
      return pharmacy;
    } catch (err) {
      throw new InternalServerErrorException(err.message);
    }
  }

  async addMedicine(req: Request) {
    const pharmacy = await this.parseToken(req);
    if (!pharmacy) {
      throw new UnauthorizedException('Pharmacy not found');
    }

    const { medicine } = req.body;
    const check = pharmacy.medicines.includes(medicine);
    if (check) {
      throw new Error('Medicine already exists');
    }

    pharmacy.medicines.push(medicine);
    await pharmacy.save();
  }

  async removeMed(req: Request) {
    const pharmacy = await this.parseToken(req);
    if (!pharmacy) {
      throw new UnauthorizedException('Pharmacy not found');
    }

    const { medicine } = req.body;
    const check = pharmacy.medicines.includes(medicine);
    if (!check) {
      throw new Error('Medicine not found');
    }

    pharmacy.medicines = pharmacy.medicines.filter((med) => med !== medicine);
    await pharmacy.save();
  }

  async getMedicines(req: Request) {
    const pharmacy = await this.parseToken(req);
    if (!pharmacy) {
      throw new UnauthorizedException('Pharmacy not found');
    }
    return pharmacy.medicines;
  }

  getDirection(req: Request) {
    return 'Get direction';
  }

  verifyPharmacy(req: Request) {
    return 'Verify pharmacy';
  }

  removeInactivePharmacies(req: Request) {
    return 'Remove inactive pharmacies';
  }
}
