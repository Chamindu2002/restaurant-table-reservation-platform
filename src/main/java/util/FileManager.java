package util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles all file I/O for reservation data.
 * Uses try-with-resources throughout to prevent resource leaks.
 */
public class FileManager {

    private static String FILE_PATH;

    public static void setFilePath(String path) {
        FILE_PATH = path;
        // Ensure the file exists on first use
        File f = new File(FILE_PATH);
        if (!f.exists()) {
            f.getParentFile().mkdirs();
            try {
                f.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException("Cannot initialise data file: " + path, e);
            }
        }
    }

    /** Appends a single CSV line to the data file. */
    public static void save(String data) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(data);
            bw.newLine();
        }
    }

    /** Returns all non-blank lines from the data file. */
    public static List<String> readAll() throws IOException {
        List<String> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    list.add(line.trim());
                }
            }
        }
        return list;
    }

    /** Replaces the entire data file with the provided lines. */
    public static void overwrite(List<String> data) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (String line : data) {
                bw.write(line);
                bw.newLine();
            }
        }
    }
}
