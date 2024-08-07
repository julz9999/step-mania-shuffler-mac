/*
 Shuffled Endless Mode Course Creator by julz, August 2024
 
 This sketch is meant to provide an easy way to create an "endless" mode from
 a folder of songs that includes ALL songs in that folder.
 
 Replace "myFolder" on lines 24 & 41 in this sketch with the name of the
 folder containing your songs. Then, change the name of the "StepMania-5.0.12"
 directory on line 24 & 38 to the version you have installed. If your song and 
 course folders are not in the default locations you will need to update those paths 
 as well. After the sketch finishes creating the course, reload the songs/courses 
 from the Options menu in SM and the course should appear in Extended Mode.
 
 This code may work for other versions of SM/ITG/Outfox etc. but I have only tested
 it with StepMania v5.0.12 on Windows.
 
 */

import java.util.Date;
PrintWriter output;
StringList songs;

void setup() {
  String path = "/Applications/StepMania-5.0.12/Songs/myFolder";

  println("Listing all filenames in a directory: ");
  String[] filenames = listFileNames(path);
  printArray(filenames);
  songs = new StringList();
  for (int i = 0; i < filenames.length; i++) {
    if (".DS_Store".equals(filenames[i]) == false) {
      songs.append(filenames[i]);
    }
  }
  songs.shuffle();
  printArray(songs);

  output = createWriter("/Applications/StepMania-5.0.12/Courses/Default/endless shuffle.crs");
  output.println("#COURSE:endless shuffle;");
  for (int i = 0; i < songs.size(); i++) {
    output.println("#SONG:myFolder/"+songs.get(i)+":Medium;");
  }
  output.flush();
  output.close();
  exit();

  noLoop();
}

void draw() {
}

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
