import { Controller, Get, Post, Req } from '@nestjs/common';
import { UserService } from './user.service';
import { Request, Response } from 'express';

@Controller('user')
export class UserController {
  constructor(private readonly userservice: UserService) {}

  /* 

        POST /user/:user_id/update-profile
        POST /user/:user_id/delete-account
        POST /user/:user_id/verify
        POST /users/:user_id/emergency-contacts Data: { contacts: array } 

    */
  @Get('pharmacies')
  getPharmacies(@Req() req: Request) {
    return this.userservice.getPharmacies(req);
  }

  @Post(':user_id/update-profile')
  updateProfile() {
    return this.userservice.updateProfile();
  }

  @Post(':user_id/delete-account')
  deleteAccount() {
    return this.userservice.deleteAccount();
  }

  @Post(':user_id/verify')
  verifyUser() {
    return this.userservice.verifyUser();
  }

  @Post('Notify-me')
  notifyMe(@Req() req: Request) {
    return this.userservice.notifyMe(req);
  }

  @Get('list-notify')
  getNotifyMe(@Req() req: Request) {
    return this.userservice.getNotifyMe(req);
  }

  @Post('emergency-contacts')
  addEmergencyContacts() {
    return this.userservice.addEmergencyContacts();
  }
}
