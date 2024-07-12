import { Body, Controller, Post, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { Request, Response } from 'express';
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
  async userLogin(@Body() reqBody: UserLoginDto, @Res() res: Response) {
    const { token } = await this.authService.userLogin(reqBody);
    if (token) {
      res
        .cookie('accessToken', token, {
          httpOnly: true,
          maxAge: 24 * 3600 * 1000,
        })
        .sendStatus(200);
    } else {
      res.cookie('accessToken', '', { maxAge: 1 }).sendStatus(409);
    }
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
  async adminLogin(@Body() reqBody: UserLoginDto, @Res() res: Response) {
    const { token } = await this.authService.adminLogin(reqBody);
    if (token) {
      res
        .cookie('accessToken', token, {
          httpOnly: true,
          maxAge: 24 * 3600 * 1000,
        })
        .sendStatus(200);
    } else {
      res.cookie('accessToken', '', { maxAge: 1 }).sendStatus(409);
    }
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
  async pharmacyLogin(@Body() reqBody: UserLoginDto, @Res() res: Response) {
    const { token } = await this.authService.pharmacyLogin(reqBody);
    if (token) {
      res
        .cookie('accessToken', token, {
          httpOnly: true,
          maxAge: 24 * 3600 * 1000,
        })
        .sendStatus(200);
    } else {
      res.cookie('accessToken', '', { maxAge: 1 }).sendStatus(409);
    }
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
