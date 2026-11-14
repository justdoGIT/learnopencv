// cli.hpp -- a tiny command-line parser shared by the demos.
// Supports "--key value" and "--flag". Nothing fancy; just enough to keep the
// demo programs readable and consistent with the Python argparse versions.
#pragma once

#include <string>
#include <unordered_map>
#include <vector>

struct Cli {
    std::unordered_map<std::string, std::string> kv;

    Cli(int argc, char** argv) {
        for (int i = 1; i < argc; ++i) {
            std::string a = argv[i];
            if (a.rfind("--", 0) == 0) {
                std::string key = a.substr(2);
                if (i + 1 < argc && std::string(argv[i + 1]).rfind("--", 0) != 0) {
                    kv[key] = argv[++i];
                } else {
                    kv[key] = "1";  // bare flag
                }
            }
        }
    }
    std::string get(const std::string& k, const std::string& def) const {
        auto it = kv.find(k);
        return it == kv.end() ? def : it->second;
    }
    int geti(const std::string& k, int def) const {
        auto it = kv.find(k);
        return it == kv.end() ? def : std::stoi(it->second);
    }
    float getf(const std::string& k, float def) const {
        auto it = kv.find(k);
        return it == kv.end() ? def : std::stof(it->second);
    }
    bool has(const std::string& k) const { return kv.count(k) > 0; }
};
