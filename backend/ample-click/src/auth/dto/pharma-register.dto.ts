import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';
export class PharmaRegisterDto {
  @IsEmail()
  @IsNotEmpty()
  @IsString()
  readonly email: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  readonly password: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(2)
  readonly name: string;
}
