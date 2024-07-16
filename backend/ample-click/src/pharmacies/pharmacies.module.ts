import { Module } from '@nestjs/common';
import { PharmaciesController } from './pharmacies.controller';
import { PharmaciesService } from './pharmacies.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserSchema } from 'src/auth/schema/user.schema';
import { PharmaSchema } from 'src/auth/schema/pharma.schema';
import { ConfigModule } from '@nestjs/config';
import { AdminSchema } from 'src/auth/schema/admin.schema';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: 'User', schema: UserSchema },
      { name: 'Admin', schema: AdminSchema },
      { name: 'Pharma', schema: PharmaSchema },
    ]),
  ],
  providers: [PharmaciesService],
  controllers: [PharmaciesController],
})
export class PharmaciesModule {}
