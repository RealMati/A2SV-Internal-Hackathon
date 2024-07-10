import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { MongooseModule } from '@nestjs/mongoose';
import { User } from './schema/user.schema';
import { Pharma } from './schema/pharma.schema';
import { Admin } from 'mongodb';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: 'User', schema: User },
      { name: 'Admin', schema: Admin },
      { name: 'Pharmacy', schema: Pharma },
    ]),
  ],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
