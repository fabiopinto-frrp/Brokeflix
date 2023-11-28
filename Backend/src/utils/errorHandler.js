exports.signUpError = (err) => {
  console.log(err.message, err.code);
  let errors = { email: "", password: "" };

  if (err.code === 11000) {
    errors.email = "Email already exists";
    return errors;
  }

  if (err.message === "user validation failed") {
    Object.values(err.errors).forEach(({ properties }) => {
      errors[properties.path] = properties.message;
    });
  }

  return errors;
};

exports.loginError = (err) => {};
