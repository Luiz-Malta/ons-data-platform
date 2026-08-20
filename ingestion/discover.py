import requests

CKAN_URL = "https://dados.ons.org.br/api/3/action/package_show"
DATASET_ID = "geracao-usina-2"

def discover_resources():
    # 1. Faz a requisição GET, passando o id do dataset como parâmetro
    response = requests.get(CKAN_URL, params={"id": DATASET_ID})

    # 2. Levanta erro se a resposta não for bem-sucedida
    response.raise_for_status()

    # 3. Converte a resposta JSON em dicionário Python
    data = response.json()

    # 4. TEU TRABALHO: navega no dicionário até a lista de resources
    #    Dica: no JSON que você colou, a estrutura era
    #    { "result": { "resources": [ ... ] } }
    resources = data["result"]["resources"]

    # 5. Imprime nome e formato de cada resource
    # monta uma lista só com os que passam no filtro
    parquets = [
        r for r in resources
        if r["format"] == "PARQUET" and "geracao_usina_2" in r["name"].lower()
    ]

    print(f"Encontrados {len(parquets)} arquivos Parquet de geração")
    for r in parquets:
        print(r["url"])

    return parquets

if __name__ == "__main__":
    discover_resources()