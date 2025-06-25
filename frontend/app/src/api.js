const BASE_URL = "http://localhost:8080";

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