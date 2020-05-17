W = 1000;
N = 20;

function cut(w, h){
  if (w == h) return 1;
  if (w > h) {
    var temp = w; w = h; h = temp;
  }
  var r = h % w;

  var result = Math.floor(h / w);
  if (r > 0) result += cut(w, r);
  return result;
}

var cnt = 0;
for (var i = 1; i <= W; i++){
  for(var j = 1; j <= W; j++){
    if ( cut(i, j) == N) cnt++;
  }
}
console.log(cnt);
