export const githubLogin = passport.authenticate("github");
globalRouter.get(routes.gitHub, githubLogin);
globalRouter.get(
     routes.githubCallback,
     passport.authenticate("github", {failureRedirect: "/login"}),
     postGithubLogin,
);
export const postGithubLogin = (req, res) => {
     res.redirect(routes.home);
};
export const githubLoginCallback = async (
     accessToken,
     refreshToken,
     profile,
     cb,
) => {
     const {
          _json: {id, avater_url, name, email}, // profile 안의 json에게서 가져온다.
     } = profile;
};
try {
     const user = await User.findOne({ email });
     if (user) {
          user.githubId = id;
          user.save();
          return cb(null, user);
     }
     const newUser = await User.create({
          email,
          name,
          githubId: id,
          avatarUrl: avatar_url
     });
     return cb(null, newUser);
} catch (error) {
     return cb(error);
}