using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace MVPSystem
{
    public partial class MyCaptcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random random = new Random();
            Bitmap bitmap = new Bitmap(150, 90);
            Graphics graphics = Graphics.FromImage(bitmap);
            graphics.Clear(Color.White);
            graphics.DrawLine(Pens.Black, random.Next(0, 50), random.Next(10, 30), random.Next(0, 200), random.Next(0, 50));
            graphics.DrawRectangle(Pens.Blue, random.Next(0, 20), random.Next(0, 20), random.Next(50, 80), random.Next(0, 20));
            graphics.DrawLine(Pens.Blue, random.Next(0, 20), random.Next(10, 50), random.Next(100, 200), random.Next(0, 80));

            Brush designBrush = new HatchBrush(HatchStyle.ForwardDiagonal, Color.LightGray, Color.DarkGray);

            RectangleF rectangleArea = new RectangleF(0, 0, 250, 250);
            graphics.FillRectangle(designBrush, rectangleArea);

            string captchaCode = string.Format("{0:X}", random.Next(1000000, 9999999));
            Session["sessionCaptcha"] = captchaCode.ToLower();

            Font font = new Font("Times New Roman", 25, FontStyle.Bold);
            graphics.DrawString(captchaCode, font, Brushes.Black, 20, 20);

            // Set the content type to image/gif
            Response.ContentType = "image/gif";

            // Save the image to the output stream
            bitmap.Save(Response.OutputStream, ImageFormat.Gif);
        }
    }
}
