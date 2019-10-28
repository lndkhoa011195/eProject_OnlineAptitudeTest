using OnlineAptitudeTest.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineAptitudeTest.Controllers
{
    public class AdminController : Controller
    {
        User user = new User();
        // GET: Admin
        public ActionResult Index()
        {
            if (!user.IsAdmin())
                return View("Error");
            return View();
        }

        public ActionResult Logout()
        {
            if (!user.IsAdmin())
                return View("Error");
            user.Reset();
            return RedirectToAction("Index", "Login");
        }
    }
}