FROM nginx:alpine

# ลบ config เดิม
RUN rm /etc/nginx/conf.d/default.conf

# ใส่ config ใหม่
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# ใส่เว็บ Flutter ที่บิ้วแล้ว
COPY build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]