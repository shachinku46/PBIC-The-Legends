PBIC THE LEGENDS - ADVANCED VERSION

Files:
index.html       Main website
profile.html     Profile page
add.html         Public profile submission form + AI introduction generator
admin.html       Admin login + approval dashboard
supabase-config.js Backend URL/key placeholder
supabase.sql     Database + RLS setup

SETUP FOR REAL CROSS-DEVICE APPROVAL
1. Create a Supabase project.
2. Run supabase.sql in Supabase SQL Editor.
3. Create Storage buckets: pbic-photos and pbic-songs. Make them public for the public gallery.
4. Create an admin user in Supabase Authentication.
5. Put your Project URL and anon/publishable key in supabase-config.js.
6. Upload all files to the same hosting folder.

AI FEATURE:
The AI introduction button works locally in the browser and does not expose an AI secret key. For a real generative AI API, connect it through a server/Edge Function; never put a private AI key in HTML/JS.
