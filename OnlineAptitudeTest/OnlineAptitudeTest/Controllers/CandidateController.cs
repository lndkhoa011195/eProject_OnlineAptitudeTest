using OnlineAptitudeTest.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineAptitudeTest.Controllers
{
    public class CandidateController : Controller
    {
        User user = new User();
        // GET: Candidate
        public ActionResult Index()
        {
            if (!user.IsCandidate())
                return View("Error");
            return View();
        }

        public ActionResult Logout()
        {
            if (!user.IsCandidate())
                return View("Error");
            user.Reset();
            return RedirectToAction("Index", "Login");
        }
    }
}