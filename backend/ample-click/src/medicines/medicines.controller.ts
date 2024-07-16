import { Controller, Get, Post, Query } from '@nestjs/common';
import { MedicinesService } from './medicines.service';

@Controller('medicines')
export class MedicinesController {
  constructor(private readonly medicinesservice: MedicinesService) {}

  /* 
    GET /medicines/search "/medicines/search?medicine_name=aspirin"
    GET /medicines/:medicine_name/instruction
    POST /medicines/:medicine_name/id/notify_me
    GET /medicines/notify_me

    */

  @Get('search')
  searchMedicine(@Query('medicine_name') medicine_name: string) {
    return this.medicinesservice.searchMedicine(medicine_name);
  }

  @Get(':medicine_name/instruction')
  getInstruction() {
    return this.medicinesservice.getInstruction();
  }

  @Post(':medicine_name/id/notify_me')
  notifyMe() {
    return this.medicinesservice.notifyMe();
  }

  @Get('notify_me')
  getNotifyMe() {
    return this.medicinesservice.getNotifyMe();
  }
}
