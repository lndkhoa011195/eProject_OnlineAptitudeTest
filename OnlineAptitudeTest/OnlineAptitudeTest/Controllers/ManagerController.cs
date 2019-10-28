using OnlineAptitudeTest.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineAptitudeTest.Controllers
{
    public class ManagerController : Controller
    {
        User user = new User();
        // GET: Manager
        public ActionResult Index()
        {
            if (!user.IsManager())
                return View("Error");
            return View();
        }

        public ActionResult Logout()
        {
            if (!user.IsManager())
                return View("Error");
            user.Reset();
            return RedirectToAction("Index", "Login");
        }
    }
}