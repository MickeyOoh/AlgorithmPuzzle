M = 9;
N = 5;

// 順列を生成
Array.prototype.permutation = function(n) {
  var result = [];
  for (var i = 0; i < this.length; i++){
    if (n > 1) {
      var remain = this.slice(0);   // 左端の除き、残り 
      remain.splice(i, 1);          // i indexから1個分削除
      var permu = remain.permutation(n - 1);
      for (var j = 0; j < permu.length; j++){
        newdata = [this[i]].concat(permu[j]);
        result.push(newdata);
      }

    } else {
      result.push([this[i]]);

    }
  }
  return result;
}

// 左端に1がある並びを生成
var temp = new Array(M - 1);
for (var i = 1; i < M; i++){
 temp[i - 1] = i + 1;
}
var permu = temp.permutation(M - 1);

var seq = [];
for (var i = 0; i < permu.length; i++){
  seq.push([1].concat(permu[i]));
}

log =[];
log.push(seq);

//for (var i = 0; i < log[0].length; i++){
//   console.log(`log[0][${i}]->${log[0][i]}`);
//}
// N回の移動を実施
for (var i = 0; i < N; i++){
  var s = [];
  for (var j = 0; j < log[i].length; j++){
    //console.log(`\nlist->${log[i][j]}`);
    for (var k = 1; k < M; k++){
      if ( log[i][j][k] == k + 1){
        // 並びを逆順にする
        //console.log(`k(${k})->${log[i][j]}`);
        temp = log[i][j].slice(0, k + 1).reverse(); // 
        temp = temp.concat(log[i][j].slice(k + 1));
        //console.log(`k(${k})->${temp}`);        
        s.push(temp);
      }
    }
  }
  log.push(s)
  ///for (var j = 0; j < log[i + 1].length; j++){
  //  console.log(`log[${i + 1}][${j}] => ${log[i + 1][j]}`)
  //}

}

console.log(log[N].length);
