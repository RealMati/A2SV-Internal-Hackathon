import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema()
export class Pharma extends Document {
  @Prop()
  name: string;

  @Prop({ unique: [true, 'Email already exists'] })
  email: string;

  @Prop()
  password: string;

  @Prop()
  city: string;

  @Prop()
  subcity: string;

  @Prop()
  coordinate: [number, number];

  @Prop()
  phone: string;

  @Prop()
  workingHours: string;

  @Prop({ default: false })
  approved: boolean;

  @Prop({ default: '' })
  picture: string;
}

export const PharmaSchema = SchemaFactory.createForClass(Pharma);
