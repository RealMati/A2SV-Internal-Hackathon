import { Module } from '@nestjs/common';
import { PharmaciesController } from './pharmacies.controller';

@Module({
  controllers: [PharmaciesController]
})
export class PharmaciesModule {}
