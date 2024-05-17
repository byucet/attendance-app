import { NextResponse } from 'next/server';

export async function POST(request) {
  const { password } = await request.json();

  // Replace 'mypassword' with your actual password
  if (password === 'BYUCET_1') {
    return NextResponse.json({ success: true }, { status: 200 });
  } else {
    return NextResponse.json({ success: false }, { status: 401 });
  }
}
