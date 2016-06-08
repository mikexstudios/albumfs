albumfs
=======

**This project is no longer being developed with last commits in 2011.**

<img src="https://github.com/mikexstudios/albumfs/blob/master/screenshots/home.png" alt="home" width="60%">

a webapp to share download links for free music albums. The idea was to 
have a community of music lovers crowdsource a directory of their favorite
albums with download links. 

## More screenshots

<table>
<tr>
  <td align="center">
   <img src="https://github.com/mikexstudios/albumfs/blob/master/screenshots/signup.png" alt="home" width="100%">
   <p><strong>Sign up</strong></p>
  </td>
  <td align="center">
    <img src="https://github.com/mikexstudios/albumfs/blob/master/screenshots/signin.png" alt="home" width="100%">
    <p><strong>Sign in</strong></p>
  </td>
</tr>
</table>

## Usage

2. Build the `Dockerfile`:

   `docker build -t mikexstudios/albumfs .`

2. Run it like:

   `docker run -d -p 80:80 mikexstudios/albumfs`

   If you want to develop while running the script, mount the current 
   directory by:

   ```docker run -d -p 80:80 -v `pwd`:/usr/src/app mikexstudios/albumfs```

3. Then visit the container's IP address in your browser. Note that since
   the IndexTank full-text search service no longer exists, searching for
   albums does not work.


TODO
----

- Add Artist show page.
- Add Album show page.
- Add pages for user to submit new albums / artists. 
- Add explanation page for submitting albums.
- Look into scoring functions for optimizing search
  (http://indextank.com/documentation/ruby-client#document-variables)
- Add left sidebar (like Google) for user to filter and sort search.
- Add right sidebox to include information on how to add an artist/album as well
  as the button for doing so.
  Need to think through the process of doing this carefully.
- Use slugs on artist, album models (https://github.com/norman/friendly_id)
- Use authorization to secure admin site.
- Check optional/required model fields.
- Expand the main page with more content and links to adding content / how the
  site works / expand description to include streaming.
- Create About page with attribution to album art placeholder icon:
  http://www.iconfinder.com/icondetails/27838/256/cd_compact_disk_dvd_icon
- Solve Heroku first load error problem.
  Seems like it is caused by SASS writing files to unwritable directory.
  https://github.com/koppen/hassle


Low priority TODO
-----------------

- Perhaps populate album tracks with last.fm album.getinfo data instead of
  musicbrainz data.
- Optimize getting list of tracks on search results page.


Completed TODO
--------------

- Install authentication system (done with devise)
- Install admin interface (done with rails_admin)
- Add Artist, Album, Source models (done).
- Add haml/compass functionality (done).
- Add unique id to body for views. (done, see application_helpers.rb)
- Theme authentication login/logout pages (done).
- On sign up page, the float: right of the button causes excessive whitespace at
  bottom of box. (completed with vertical centering)
- Populate database with information from 3rd party. Get the top N artists in
  the charts.
  1. Use an API to get top N artists from charts. Then save into database.
  2. Write script that takes artists from database, then gets albums from that artist.
- Setup indextank for search.
  Use: https://github.com/kidpollo/tanker
- Add search box to search page.
- Search box on home page.
- Get album art from last.fm
- Save database dump once we populate the database correctly.
  See: https://github.com/ludicast/yaml_db
  And: http://devcenter.heroku.com/articles/taps
- Display and stylize search results
- Set page title on devise auth pages. May have to start building own templates.
  Can use a hack to set the title by detecting the controller and action.
- Fix heroku bug where searching for 'the' or '.' gives page looking for doesn't
  exist.
  (Seems like the problem was that I needed to migrate the db.)
- Add ability to search through albums / songs / artists.
- Display message is artist is not found.


Won't Fix TODO
--------------
- Make another layout template that does not use the applications layout template.
  (not done, but instead hiding the header with css)
