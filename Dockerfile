# ใช้ Flutter SDK image
FROM ghcr.io/flutter/flutter:latest AS build

# กำหนด Working Directory
WORKDIR /app

# คัดลอกไฟล์ Flutter ทั้งหมดไปที่ container
COPY . .

# ติดตั้ง dependencies และ build Flutter Web
RUN flutter pub get
RUN flutter build web --release

# ใช้ Nginx สำหรับเสิร์ฟเว็บ
FROM nginx:latest

# คัดลอกไฟล์จาก Flutter build ไปที่ Nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# เปิดพอร์ต 80
EXPOSE 80

# รัน Nginx
CMD ["nginx", "-g", "daemon off;"]

