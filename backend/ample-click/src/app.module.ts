import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { MongooseModule } from '@nestjs/mongoose';
import { MedicinesController } from './medicines/medicines.controller';
import { MedicinesModule } from './medicines/medicines.module';
import { PharmaciesService } from './pharmacies/pharmacies.service';
import { PharmaciesModule } from './pharmacies/pharmacies.module';

@Module({
  imports: [
    AuthModule,
    MongooseModule.forRoot(process.env.DB_CONNECTION_STRING),
    MedicinesModule,
    PharmaciesModule,
  ],
  controllers: [AppController, MedicinesController],
  providers: [AppService, PharmaciesService],
})
export class AppModule {}
