import React, { useState } from "react";
import { shortenUrl } from "./api";
import { BASE_URL } from "./api";

function App() {
  const [url, setUrl] = useState("");
  const [shortUrl, setShortUrl] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const data = await shortenUrl(url);
      setShortUrl(`${BASE_URL}/${data.short_id}`);
    } catch (err) {
      alert("Ошибка при сокращении ссылки");
    }
  };

  return (
    <div style={{ padding: 20, fontFamily: "sans-serif" }}>
      <h1>URL Shortener</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="url"
          placeholder="Вставьте длинный URL"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          style={{ width: "300px", marginRight: "10px" }}
          required
        />
        <button type="submit">Сократить</button>
      </form>
      {shortUrl && (
        <p>
          Сокращённый URL:{" "}
          <a href={shortUrl} target="_blank" rel="noopener noreferrer">
            {shortUrl}
          </a>
        </p>
      )}
    </div>
  );
}

export default App;