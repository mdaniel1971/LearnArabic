import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Learn Arabic",
  description: "Learn Arabic application",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning translate="no">
      <head>
        <meta name="google" content="notranslate" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
      </head>
      <body suppressHydrationWarning translate="no">{children}</body>
    </html>
  );
}

