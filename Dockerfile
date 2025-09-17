# Use Debian-based Node image
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Copy package.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy app code
COPY . .

# Use non-root user
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
