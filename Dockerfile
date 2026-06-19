# Stage 1 — Builder
FROM nginx:alpine AS builder
WORKDIR /app
COPY app/ /app/

# Stage 2 — Production (clean, minimal image)
FROM nginx:alpine AS production
COPY --from=builder /app/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]