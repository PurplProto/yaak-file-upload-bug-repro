import {
  BadRequestException,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Logger,
  Post,
  UploadedFiles,
  UseInterceptors,
} from '@nestjs/common';
import { AppService } from './app.service';
import { FilesInterceptor } from '@nestjs/platform-express';

@Controller()
export class AppController {
  private readonly logger = new Logger(AppController.name);

  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Post('document/upload')
  @HttpCode(HttpStatus.OK)
  @UseInterceptors(FilesInterceptor('files'))
  uploadFile(@UploadedFiles() files: Express.Multer.File[]) {
    this.logger.log(`Received ${files.length} file(s)`);

    if (files?.length === 0) {
      this.logger.warn('No files were passed!');
      throw new BadRequestException(
        'No files were passed! Please check the request.',
      );
    }

    files.forEach((file, index) => {
      const logData = {
        originalname: file.originalname,
        mimetype: file.mimetype,
        size: file.size + ' bytes',
      };
      this.logger.log(
        `File uploaded (${index + 1}/${files.length}) - \n${JSON.stringify(logData, null, 2)}\n`,
      );
    });
  }
}
