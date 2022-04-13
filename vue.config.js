module.exports = {
  // 选项...
  // 基本路径
  publicPath: './',
  // 生产环境是否生成 sourceMap 文件
  productionSourceMap: false,
  devServer: {
    proxy: {
      '/apa': {
        // target: 'http://10.74.69.50:8088',//初阳
        // target: 'http://10.73.44.38:8088/',
        // target: 'http://10.74.67.44:8088/',
        target: 'https://devnewdota.smartmidea.net/admin-service',
        // target: 'http://10.73.41.36:8085/',
        changeOrigin: true,
        pathRewrite: {
          '^/apa': ''
        }
      },
    }
  }
}