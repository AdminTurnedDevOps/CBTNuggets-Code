using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;


namespace WPFTEST
{
    public partial class App : Application
    {
        static void OnStartup()
        {
            AppCenter.Start("b0c63a79-103c-4bcb-8c68-cf76267e87f8",
            typeof(Analytics), typeof(Crashes));
        }

    }
}
