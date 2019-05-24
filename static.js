const serve = require('koa-static');
const mount = require('koa-mount');
const Koa = require('koa');
const app = new Koa();

// $ GET /package.json
app.use(serve('dist'));
app.use(mount('/static', serve('/data/static')));
app.use(mount('/media', serve('/data/media')));

app.listen(3000);

console.log('listening on port 3000');
