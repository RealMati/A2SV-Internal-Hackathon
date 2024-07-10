import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { UserLoginDto } from './dto/user-login.dto';
import { UserRegisterDto } from './dto/user-register.dto';
import { PharmaRegisterDto } from './dto/pharma-register.dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}
  /* 
    POST /auth/userLogin
    POST /auth/userRegister
    POST /auth/userLogout

    POST /auth/adminLogin
    POST /auth/adminRegister
    POST /auth/adminLogout

    POST /auth/pharmacyLogin
    POST /auth/pharmacyRegister
    POST /auth/pharmacyLogout

    */

  // User
  @Post('user/login')
  userLogin() {
    return this.authService.userLogin();
  }

  @Post('user/register')
  userRegister(@Body() reqBody: UserRegisterDto) {
    return this.authService.userRegister(reqBody);
  }

  @Post('user/logout')
  userLogout() {
    return this.authService.userLogout();
  }

  // Admin
  @Post('admin/login')
  adminLogin() {
    return this.authService.adminLogin();
  }

  @Post('admin/register')
  adminRegister(@Body() reqBody: UserRegisterDto) {
    return this.authService.adminRegister(reqBody);
  }

  @Post('admin/logout')
  adminLogout() {
    return this.authService.adminLogout();
  }

  // Pharmacy
  @Post('pharmacy/login')
  pharmacyLogin() {
    return this.authService.pharmacyLogin();
  }

  @Post('pharmacy/register')
  pharmacyRegister(@Body() reqBody: PharmaRegisterDto) {
    return this.authService.pharmacyRegister(reqBody);
  }

  @Post('pharmacy/logout')
  pharmacyLogout() {
    return this.authService.pharmacyLogout();
  }
}
