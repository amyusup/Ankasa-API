const authModels = require("../models/auth");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { response } = require("../helpers/");
var nodemailer = require("nodemailer");

module.exports = {
  postLogin: async function (req, res) {
    try {
      const setData = req.body;
      console.log(setData);
      const result = await authModels.checkUser(setData.email);
      if (!result[0]) {
        res.status(401).send({
          message: "Email Not Found",
        });
      }
      let check = true;
      await authModels.postDevice(setData.device_token, setData.email); // after edit
      if (result[0].role != 6) {
        check = bcrypt.compareSync(setData.password, result[0].password);
      }
      if (check) {
        const { id, email, name, photo, phone, role, device_token } = result[0];
        const token = jwt.sign(
          {
            id,
            name,
            email,
            photo,
            phone,
            role,
            device_token,
          },
          process.env.SECRET_KEY
        );
        let roles = "user";
        if (role == 6) {
          roles = "admin";
        }
        response(res, 200, {
          message: "Auth Success",
          token,
          roles,
        });
      } else {
        res.status(401).send({
          message: "Invalid Password",
        });
      }
    } catch (error) {
      console.log(error);
      response(res, 500, { message: error.message });
    }
  },
  postRegister: async function (req, res) {
    try {
      const setData = req.body;
      // console.log(setData.email)
      const checkUser = await authModels.checkUser(setData.email);
      // console.log(checkUser)
      if (checkUser[0]) {
        // return response(res, 403, "Email already exist");
        return response(res, 403, { message: "Email already exist" });
      }
      const salt = bcrypt.genSaltSync(10);
      const hash = bcrypt.hashSync(req.body.password, salt);
      const newData = {
        ...setData,
        password: hash,
      };
      const result = await authModels.postRegister(newData);
      response(res, 200, { data: result, message: "Register Success" });
    } catch (error) {
      response(res, 500, { message: error.message });
      // response(res, 500, error);
    }
  },

  forgotPassword: async function (req, res) {
    try {
      let setData = req.body;
      const check = await authModels.checkUser(setData);
      if (check.length) {
        const salt = bcrypt.genSaltSync(10);
        const hash = bcrypt.hashSync(setData.password, salt);
        setData.password = hash;
        const reset = await authModels.resetPassword(
          setData.email,
          setData.password
        );
        response(res, 200, reset);
      } else {
        response(res, 403, { message: "Email Not Found" });
      }
    } catch (error) {
      response(res, 500, { message: error.message });
    }
  },
  emailCheck: async function (req, res) {
    try {
      const setData = req.body;
      const check = await authModels.checkUser(setData);
      console.log(check[0]);
      if (check.length) {
        response(res, 200, { message: "Email already exist" });
      } else {
        response(res, 200, { message: "Email Not Found" });
      }
    } catch (error) {
      response(res, 500, { message: error.message });
    }
  },

  makeVerificationCode: function (length) {
    var result = "";
    var characters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  },

  //  console.log(makeid(5));
  sendEmail: function (req, res) {
    try {
      const { mailTo } = req.body

      var verification = "";
      var characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      var charactersLength = characters.length;
      for (var i = 0; i < 5; i++) {
        verification += characters.charAt(Math.floor(Math.random() * charactersLength));
      }

      var transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
          user: "ankasa.surel@gmail.com",
          pass: "ankasa.pass",
        },
      });

      var mailOptions = {
        from: "ankasa.surel@gmail.com",
        to: mailTo,
        subject: "Verification code Ankasa Mobile",
        text: `We have received a request to forget your password, immediately confirm with the following verification code : ${verification}`,
      };

      transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
          console.log(error);
          response(res, 500, { message: error });
        } else {
          console.log("Email sent: " + info.response);
          response(res, 200, { message: "Email sent: " + info.response });
        }
      });
    } catch (error) {
      response(res, 500, { message: error.message });
    }
  },
};
