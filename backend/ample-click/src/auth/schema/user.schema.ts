import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema()
export class User extends Document {
  @Prop()
  name: string;

  @Prop()
  email: string;

  @Prop()
  password: string;

  @Prop({ default: [], type: [String] })
  notify: string[];
}

export const UserSchema = SchemaFactory.createForClass(User);
