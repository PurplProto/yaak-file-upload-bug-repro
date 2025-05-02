import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

// Side affect imports required for types to be available
import 'express';
import 'multer';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(process.env.PORT ?? 3042);
}
void bootstrap()
  .catch((err) => {
    console.error('Error starting the application:', err);
    process.exit(1);
  })
  .then(() => {
    console.log(`\nApplication started on port ${process.env.PORT ?? 3042}\n`);
  });
