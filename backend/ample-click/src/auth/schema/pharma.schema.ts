import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class Pharma {
  @Prop()
  name: string;

  @Prop()
  email: string;

  @Prop()
  password: string;
}

export const PharmaSchema = SchemaFactory.createForClass(Pharma);
