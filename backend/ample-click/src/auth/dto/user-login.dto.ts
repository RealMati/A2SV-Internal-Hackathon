import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';
export class UserLoginDto {
  @IsEmail()
  @IsNotEmpty()
  @IsString()
  readonly email: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  readonly password: string;
}
