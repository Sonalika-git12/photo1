module.exports = {
  apps: [
    {
      name: "photography-app", // Name of your application
      script: "server.js",     // Main entry point of your application
      instances: 1,            // Number of instances (1 for now, change for scaling)
      autorestart: true,       // Auto-restart on failure
      watch: false,            // Disable watching files for changes
      max_memory_restart: "1G" // Restart if memory exceeds 1GB
    }
  ]
};
