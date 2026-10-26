/* Rename to config.js and include before app.js in index.html, if using Supabase.
 * Public anon/publishable key only. NEVER paste a service_role key into client code.
 */
window.MTG_CONFIG = {
  supabaseUrl: 'https://YOUR_PROJECT.supabase.co',
  supabaseAnonKey: 'YOUR_PUBLIC_ANON_KEY'
};
