passport.use(
     new GithubStrategy(
          {
               clientID: 'e702f28cc59ad37a2e63',
               clientSecret: '4c5f831876a4ebc5976b420b12e1dfaf94d5a0a7' ,
               callbackURL: `http://localhost:8070/callback`
          },
          githubLoginCallback // 사용자가 github에서 돌아왔을때 실행되는 함수
     )
);