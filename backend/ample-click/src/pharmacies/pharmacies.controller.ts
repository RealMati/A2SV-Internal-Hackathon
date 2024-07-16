import { Controller, Delete, Get, Post, Query, Req } from '@nestjs/common';
import { PharmaciesService } from './pharmacies.service';
import { Request, Response } from 'express';

@Controller('pharmacies')
export class PharmaciesController {
  constructor(private readonly pharmaservice: PharmaciesService) {}

  /* 
    POST /pharmacies/add-medicine 
    GET /pharmacies/medicines "/pharmacies/medicines?medicine_name=aspirin"
    POST /pharmacies/:pharma_id/update-stock
    POST /pharmacies/:pharma_id/direction
    GET /pharmacies/medicines "/pharmacies/medicines?medicine_name=aspirin"
    POST /pharmacies/verify Data: { TIN: string, trade_permission_documents: string, location: string }
    DELETE /pharmacies/inactive  Remove pharmacies that have been inactive for 6 months. Data: { pharmacy_id: string }
    
    */
  @Get('medicines')
  getMedicines(@Req() req: Request) {
    return this.pharmaservice.getMedicines(req);
  }

  @Post('add-medicine')
  addMedicine(@Req() req: Request) {
    return this.pharmaservice.addMedicine(req);
  }

  @Post('remove-medicine')
  removeMed(@Req() req: Request) {
    return this.pharmaservice.removeMed(req);
  }

  @Post(':pharma_id/direction')
  getDirection(@Req() req: Request) {
    return this.pharmaservice.getDirection(req);
  }

  @Post('verify')
  verifyPharmacy(@Req() req: Request) {
    return this.pharmaservice.verifyPharmacy(req);
  }

  @Delete('inactive')
  removeInactivePharmacies(@Req() req: Request) {
    return this.pharmaservice.removeInactivePharmacies(req);
  }
}
