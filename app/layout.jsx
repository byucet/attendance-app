import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={`${inter.className}`}>
        <div className="h-screen  p-4 md:p-10">{children}</div>
      </body>
    </html>
  );
}
