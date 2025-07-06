# Build stage
FROM node:18-alpine as build

WORKDIR /app

COPY package*.json ./

# Install all dependencies (including dev dependencies needed for build)
RUN npm ci

COPY . .

# Add build args for VITE_API_TOKEN and VITE_API_URL
ARG VITE_API_TOKEN
ARG VITE_API_URL
ENV VITE_API_TOKEN=$VITE_API_TOKEN
ENV VITE_API_URL=$VITE_API_URL

RUN npm run build

# Production stage
FROM nginx:alpine

# Copy built files to nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
