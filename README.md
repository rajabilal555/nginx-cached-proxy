# nginx-cached-proxy

A lightweight nginx reverse proxy with built-in caching capabilities. This setup provides an easy way to add a caching layer in front of any HTTP service.

## Features

- Automatic caching of responses
- Cache bypass options via query parameters
- Custom cache settings for different HTTP status codes
- Health check headers
- Configurable via environment variables

## Usage

### Quick Start

```bash
docker run -e PROXY_PASS_URL=http://your-backend-service:port -p 80:80 your-image-name
```

### Environment Variables

- `PROXY_PASS_URL`: The target URL to proxy requests to (required)
- `WORKER_PROCESSES`: Number of worker processes (default: 2)
- `WORKER_CONNECTIONS`: Number of worker connections (default: 1024)
- `CACHE_SIZE`: Maximum cache size (default: 3g)

### Cache Control

The proxy supports several cache control mechanisms:

- Use `?nocache=1` to bypass cache
- Use `?bypass=1` to force bypass cache
- Use `?debug=1` to bypass cache and see debug headers

### Cache Settings

- Cache is stored in `/var/cache/nginx`
- Maximum cache size: 7GB
- Cache inactive timeout: 2 days
- Valid responses (200, 206) are cached for 10 hours
- Timeout responses (503) are cached for 10 seconds
- Other responses are cached for 1 minute

### Headers

The proxy adds several headers to help with debugging and monitoring:

- `X-Cache`: Shows cache status (HIT/MISS/BYPASS)
- `X-Forwarded-*`: Standard proxy headers
- `X-Real-IP`: Original client IP

## Building

```bash
docker build -t nginx-cached-proxy .
```

## License

MIT
