N = 100;

var cnt = 0;
for(var rock = 0; rock <= N; rock++){
  for(var scissors = 0; scissors <= N - rock; scissors++){
    var paper = N - rock - scissors;
    if(rock > scissors){
      if(rock != paper)
        cnt++;
    } else if(rock < scissors){
      if(scissors != paper)
        cnt++;
    } else {
      if(rock < paper)
        cnt++;
    }
  }
}
console.log(cnt);