/* global __env */
export const BASE_URL = "https://api.url-shortener.42web.io";

export async function shortenUrl(originalUrl) {
  const response = await fetch(`${BASE_URL}/shorten`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ original_url: originalUrl }),
  });

  if (!response.ok) {
    throw new Error("Ошибка при сокращении URL");
  }

  return response.json();
}