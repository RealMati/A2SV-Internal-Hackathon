import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { MongooseModule } from '@nestjs/mongoose';
import { MedicinesController } from './medicines/medicines.controller';
import { MedicinesModule } from './medicines/medicines.module';
import { PharmaciesService } from './pharmacies/pharmacies.service';
import { PharmaciesModule } from './pharmacies/pharmacies.module';
import { UserModule } from './user/user.module';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MedicinesService } from './medicines/medicines.service';
import { PharmaciesController } from './pharmacies/pharmacies.controller';
import { UserController } from './user/user.controller';
import { UserService } from './user/user.service';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    MongooseModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        uri: configService.get<string>('DB_CONNECTION_STRING'),
      }),
      inject: [ConfigService],
    }),
    AuthModule,
    MedicinesModule,
    PharmaciesModule,
    UserModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
