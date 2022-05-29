const gulp = require('gulp');
const rsync = require('gulp-rsync');
const replace = require('gulp-replace');

gulp.task('up', function() {
    return gulp.src(['img/**']).pipe(rsync({
        root: 'img',
        hostname: 'conoha',
        destination: '/home/kusanagi/www.image-pit.com/DocumentRoot/sboot-text/img'
    }));
});

gulp.task('build', function() {
    return gulp.src(['*.md'])
    .pipe(replace(/\/\/abstract{\n([\s\S]*?)\n.*\/\/}/g, '')) // //abstract{ ~ //}を削除
    .pipe(replace(/\/\/makechaptitlepage\[toc=on\]/g, '')) // //makechaptitlepage[toc=on]を削除
    .pipe(replace(/!\[(.*)\]\(\.\.\/\.\.\/(.*)\)/g, '<img src="https://www.image-pit.com/sboot-text/$2" alt="$1" style="display:block;margin:0 auto;border:1px solid #000;"><div style="text-align:center;font-weight:bold;color:#666;padding:5px;">$1</div>')) // 画像キャプション追加
    .pipe(gulp.dest('build/'));
});

gulp.task('build2', function() {
    return gulp.src(['*.md'])
    .pipe(replace(/\/\/abstract{\n([\s\S]*?)\n.*\/\/}/g, '')) // //abstract{ ~ //}を削除
    .pipe(replace(/\/\/makechaptitlepage\[toc=on\]/g, '{{>toc}}')) // //makechaptitlepage[toc=on]を削除
    .pipe(replace(/!\[(.*)\]\((.*)\)/g, '![$1](https://www.image-pit.com/sboot-text/$2)')) // 画像キャプション追加
    .pipe(gulp.dest('build/'));
});

gulp.task("default", gulp.series('up', 'build2', function(done) {
    done();
}));